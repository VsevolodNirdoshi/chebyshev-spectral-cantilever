import os
import math
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.ticker import FuncFormatter
from matplotlib.gridspec import GridSpec

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))

def _to_float(s: str) -> float:
    s = s.strip()
    if not s:
        raise ValueError("Empty numeric field")
    s = s.replace(",", ".")
    return float(s)

def read_xy_csv(path: str):
    xs, ys = [], []
    with open(path, "r", encoding="utf-8-sig") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            low = line.lower()
            if low.startswith("x"):
                continue

            delim = ";" if ";" in line else ","
            parts = [p.strip() for p in line.split(delim)]
            if len(parts) < 2:
                continue

            try:
                x = _to_float(parts[0])
                y = _to_float(parts[1])
            except ValueError:
                continue

            xs.append(x)
            ys.append(y)

    return np.array(xs, dtype=float), np.array(ys, dtype=float)

def sci_mathtext(v: float, digits: int = 3) -> str:
    if v == 0 or abs(v) < 1e-300:
        return r"$0$"
    av = abs(v)
    expo = int(math.floor(math.log10(av)))
    mant = v / (10 ** expo)
    return rf"${mant:.{digits}f}\times 10^{{{expo}}}$"

def make_sci_formatter(digits: int = 2):
    def _fmt(x, pos):
        if x == 0 or abs(x) < 1e-300:
            return r"$0$"
        ax = abs(x)
        expo = int(math.floor(math.log10(ax)))
        mant = x / (10 ** expo)
        return rf"${mant:.{digits}f}\times 10^{{{expo}}}$"
    return FuncFormatter(_fmt)

def plot_both_kinds(prefix="compare_both_", folder=".", show_errors=True):
    # ==================== TABLE WIDTH SETTINGS ====================
    METRIC_W = 0.50
    VALUE_W  = 0.38

    # ==================== VISUAL SETTINGS ====================
    # main curves
    LW_FUNC      = 1.2  #1.2   # original f(x)
    LW_INTERP_1  = 1.2  #1.2   # first kind interpolants
    LW_INTERP_2  = 1.2  #1.2   # second kind interpolants

    # residuals (right axis)
    LW_RESIDUAL  = 0.9

    # nodes
    NODE_SIZE    = 40

    # grid look
    GRID_LW      = 0.8
    GRID_ALPHA   = 0.7

    # legend
    LEGEND_NCOL  = 2     
    LEGEND_FS    = 9

    # =============================================================

    # Files
    f_path = os.path.join(folder, f"{prefix}f.csv")

    fuL_path = os.path.join(folder, f"{prefix}first_uL.csv")
    fuG_path = os.path.join(folder, f"{prefix}first_uG.csv")
    fnL_path = os.path.join(folder, f"{prefix}first_nodesL.csv")
    fnG_path = os.path.join(folder, f"{prefix}first_nodesG.csv")
    frL_path = os.path.join(folder, f"{prefix}first_rL.csv")
    frG_path = os.path.join(folder, f"{prefix}first_rG.csv")

    suL_path = os.path.join(folder, f"{prefix}second_uL.csv")
    suG_path = os.path.join(folder, f"{prefix}second_uG.csv")
    snL_path = os.path.join(folder, f"{prefix}second_nodesL.csv")
    snG_path = os.path.join(folder, f"{prefix}second_nodesG.csv")
    srL_path = os.path.join(folder, f"{prefix}second_rL.csv")
    srG_path = os.path.join(folder, f"{prefix}second_rG.csv")

    # Read curves
    xf, yf = read_xy_csv(f_path)

    x_fuL, y_fuL = read_xy_csv(fuL_path) if os.path.exists(fuL_path) else (np.array([]), np.array([]))
    x_fuG, y_fuG = read_xy_csv(fuG_path) if os.path.exists(fuG_path) else (np.array([]), np.array([]))
    x_suL, y_suL = read_xy_csv(suL_path) if os.path.exists(suL_path) else (np.array([]), np.array([]))
    x_suG, y_suG = read_xy_csv(suG_path) if os.path.exists(suG_path) else (np.array([]), np.array([]))

    # Nodes
    x_fnL, y_fnL = read_xy_csv(fnL_path) if os.path.exists(fnL_path) else (np.array([]), np.array([]))
    x_fnG, y_fnG = read_xy_csv(fnG_path) if os.path.exists(fnG_path) else (np.array([]), np.array([]))
    x_snL, y_snL = read_xy_csv(snL_path) if os.path.exists(snL_path) else (np.array([]), np.array([]))
    x_snG, y_snG = read_xy_csv(snG_path) if os.path.exists(snG_path) else (np.array([]), np.array([]))

    # Residuals
    x_frL = r_frL = x_frG = r_frG = np.array([])
    x_srL = r_srL = x_srG = r_srG = np.array([])

    if show_errors:
        if os.path.exists(frL_path): x_frL, r_frL = read_xy_csv(frL_path)
        if os.path.exists(frG_path): x_frG, r_frG = read_xy_csv(frG_path)
        if os.path.exists(srL_path): x_srL, r_srL = read_xy_csv(srL_path)
        if os.path.exists(srG_path): x_srG, r_srG = read_xy_csv(srG_path)

    # maxima
    e1Lmax = float(np.max(np.abs(r_frL))) if r_frL.size else 0.0
    e1Gmax = float(np.max(np.abs(r_frG))) if r_frG.size else 0.0
    e2Lmax = float(np.max(np.abs(r_srL))) if r_srL.size else 0.0
    e2Gmax = float(np.max(np.abs(r_srG))) if r_srG.size else 0.0

    # winner: best of 4
    best_name = "—"
    best_val = None
    candidates = [
        ("First kind Lobatto", e1Lmax),
        ("First kind Gauss",   e1Gmax),
        ("Second kind Lobatto", e2Lmax),
        ("Second kind Gauss",   e2Gmax),
    ]
    for name, val in candidates:
        if val > 0 and (best_val is None or val < best_val):
            best_val = val
            best_name = name

    # ===== Layout =====
    fig = plt.figure(figsize=(13, 7))
    gs_outer = GridSpec(
        nrows=2, ncols=1,
        height_ratios=[6.0, 1.55],  # more vertical room for legend+table
        hspace=0.20,
        figure=fig
    )

    ax = fig.add_subplot(gs_outer[0])
    axr = ax.twinx()
    axr.set_ylabel("residual r(x)", color="red")
    axr.tick_params(axis="y", colors="red")
    axr.spines["right"].set_color("red")

    gs_bottom = gs_outer[1].subgridspec(
        nrows=1, ncols=2,
        width_ratios=[1.10, 0.90],
        wspace=0.06
    )
    ax_tbl = fig.add_subplot(gs_bottom[0])
    ax_leg = fig.add_subplot(gs_bottom[1])
    ax_tbl.axis("off")
    ax_leg.axis("off")

    # ===== PLOTS (thickness controlled by your settings) =====
    ax.plot(xf, yf, linewidth=LW_FUNC, label="Original function f(x)")

    if x_fuL.size: ax.plot(x_fuL, y_fuL, linewidth=LW_INTERP_1, label="First kind Lobatto u_L(x)")
    if x_fuG.size: ax.plot(x_fuG, y_fuG, linewidth=LW_INTERP_1, label="First kind Gauss u_G(x)")
    if x_suL.size: ax.plot(x_suL, y_suL, linewidth=LW_INTERP_2, label="Second kind Lobatto u_L(x)")
    if x_suG.size: ax.plot(x_suG, y_suG, linewidth=LW_INTERP_2, label="Second kind Gauss u_G(x)")

    if x_fnL.size: ax.scatter(x_fnL, y_fnL, s=NODE_SIZE, label="First kind Lobatto nodes")
    if x_fnG.size: ax.scatter(x_fnG, y_fnG, s=NODE_SIZE, label="First kind Gauss nodes")
    if x_snL.size: ax.scatter(x_snL, y_snL, s=NODE_SIZE, label="Second kind Lobatto nodes")
    if x_snG.size: ax.scatter(x_snG, y_snG, s=NODE_SIZE, label="Second kind Gauss nodes")

    if show_errors:
        if r_frL.size: axr.plot(x_frL, r_frL, linewidth=LW_RESIDUAL, linestyle="--", label="First kind residual r_L(x)")
        if r_frG.size: axr.plot(x_frG, r_frG, linewidth=LW_RESIDUAL, linestyle="--", label="First kind residual r_G(x)")
        if r_srL.size: axr.plot(x_srL, r_srL, linewidth=LW_RESIDUAL, linestyle="--", label="Second kind residual r_L(x)")
        if r_srG.size: axr.plot(x_srG, r_srG, linewidth=LW_RESIDUAL, linestyle="--", label="Second kind residual r_G(x)")

        eMax = max(e1Lmax, e1Gmax, e2Lmax, e2Gmax)
        if eMax <= 0:
            eMax = 1e-12
        axr.set_ylim(-eMax, eMax)

    ax.set_title("Both-kinds comparison: f(x), interpolants, nodes, and residuals")
    ax.set_xlabel("x")
    ax.set_ylabel("value")
    ax.grid(True, linewidth=GRID_LW, alpha=GRID_ALPHA)
    axr.yaxis.set_major_formatter(make_sci_formatter(digits=2))
    ax.tick_params(axis="x", pad=6)

    # give space
    fig.subplots_adjust(bottom=0.10, top=0.92, right=0.87)

    # ===== LEGEND (2 columns) =====
    h1, l1 = ax.get_legend_handles_labels()
    h2, l2 = axr.get_legend_handles_labels()
    handles = h1 + h2
    labels  = l1 + l2

    ax_leg.legend(
        handles, labels,
        loc="upper right",
        bbox_to_anchor=(1.0, 1.0),
        frameon=True,
        fontsize=LEGEND_FS,
        borderaxespad=0.0,
        handlelength=2.0,
        ncol=LEGEND_NCOL,          # <-- 2 columns
        columnspacing=1.2,
        labelspacing=0.6
    )
    ax_leg.set_anchor("E")

    # ===== TABLE (wider Value col, narrower Metric col) =====
    rows = [
        [r"First kind Lobatto max $|r_L(x)|$",  sci_mathtext(e1Lmax, 3) if e1Lmax > 0 else r"$\mathrm{n/a}$"],
        [r"First kind Gauss max $|r_G(x)|$",    sci_mathtext(e1Gmax, 3) if e1Gmax > 0 else r"$\mathrm{n/a}$"],
        [r"Second kind Lobatto max $|r_L(x)|$", sci_mathtext(e2Lmax, 3) if e2Lmax > 0 else r"$\mathrm{n/a}$"],
        [r"Second kind Gauss max $|r_G(x)|$",   sci_mathtext(e2Gmax, 3) if e2Gmax > 0 else r"$\mathrm{n/a}$"],
        ["More accurate method", best_name],
    ]

    table = ax_tbl.table(
        cellText=rows,
        colLabels=["Metric", "Value"],
        loc="upper left",
        cellLoc="left",
        colLoc="left",
        edges="closed",
    )
    table.auto_set_font_size(False)
    table.set_fontsize(9)
    table.scale(1.0, 1.15)

    # width control
    for (r, c), cell in table.get_celld().items():
        if c == 0:
            cell.set_width(METRIC_W)
        elif c == 1:
            cell.set_width(VALUE_W)

    plt.show()

if __name__ == "__main__":
    plot_both_kinds(prefix="compare_both_", folder=SCRIPT_DIR, show_errors=True)
