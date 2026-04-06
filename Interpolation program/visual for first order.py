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

def plot_first_kind_comparison(prefix="compare_", folder=".", show_errors=True):
    # ==================== TABLE WIDTH SETTINGS ====================
    METRIC_W = 0.50
    VALUE_W  = 0.38

    # ==================== VISUAL SETTINGS (LINE THICKNESS, ETC.) ====================
    LW_FUNC     = 1.2 #1.2   # original f(x)
    LW_INTERP   = 1.2 #1.2   # interpolants
    LW_RESIDUAL = 0.9   # residuals on right axis
    NODE_SIZE   = 40
    GRID_LW     = 0.8
    GRID_ALPHA  = 0.7
    LEGEND_FS   = 9

    # Files
    f_path  = os.path.join(folder, f"{prefix}f.csv")
    uL_path = os.path.join(folder, f"{prefix}uL.csv")
    uG_path = os.path.join(folder, f"{prefix}uG.csv")
    nL_path = os.path.join(folder, f"{prefix}nodesL.csv")
    nG_path = os.path.join(folder, f"{prefix}nodesG.csv")
    rL_path = os.path.join(folder, f"{prefix}rL.csv")
    rG_path = os.path.join(folder, f"{prefix}rG.csv")

    # Read curves
    xf, yf = read_xy_csv(f_path)
    xL, yL = read_xy_csv(uL_path)
    xG, yG = read_xy_csv(uG_path)

    xNL, yNL = (np.array([]), np.array([]))
    xNG, yNG = (np.array([]), np.array([]))
    if os.path.exists(nL_path):
        xNL, yNL = read_xy_csv(nL_path)
    if os.path.exists(nG_path):
        xNG, yNG = read_xy_csv(nG_path)

    # Residuals
    xrL = rL = xrG = rG = np.array([])
    if show_errors and os.path.exists(rL_path) and os.path.exists(rG_path):
        xrL, rL = read_xy_csv(rL_path)
        xrG, rG = read_xy_csv(rG_path)

    eLmax = float(np.max(np.abs(rL))) if rL.size else 0.0
    eGmax = float(np.max(np.abs(rG))) if rG.size else 0.0

    winner = "—"
    if eLmax > 0 and eGmax > 0:
        if eLmax < eGmax:
            winner = "Lobatto"
        elif eGmax < eLmax:
            winner = "Gauss"
        else:
            winner = "Similar"

    # === Layout: plot on top, bottom row split into [table | legend] ===
    fig = plt.figure(figsize=(12, 7))
    gs_outer = GridSpec(
        nrows=2, ncols=1,
        height_ratios=[6.2, 1.15],
        hspace=0.18,
        figure=fig
    )

    ax = fig.add_subplot(gs_outer[0])
    axr = ax.twinx()
    axr.set_ylabel("residual r(x)", color="red")
    axr.tick_params(axis="y", colors="red")
    axr.spines["right"].set_color("red")

    gs_bottom = gs_outer[1].subgridspec(
        nrows=1, ncols=2,
        width_ratios=[1.15, 0.85],
        wspace=0.06
    )
    ax_tbl = fig.add_subplot(gs_bottom[0])
    ax_leg = fig.add_subplot(gs_bottom[1])
    ax_tbl.axis("off")
    ax_leg.axis("off")

    # ---- plot curves ----
    ax.plot(xf, yf, linewidth=LW_FUNC, label="Original function f(x)")
    ax.plot(xL, yL, linewidth=LW_INTERP, label="First kind Lobatto interpolant u_L(x)")
    ax.plot(xG, yG, linewidth=LW_INTERP, label="First kind Gauss interpolant u_G(x)")

    if xNL.size:
        ax.scatter(xNL, yNL, s=NODE_SIZE, label="First kind Lobatto nodes")
    if xNG.size:
        ax.scatter(xNG, yNG, s=NODE_SIZE, label="First kind Gauss nodes")

    if show_errors and rL.size and rG.size:
        axr.plot(xrL, rL, linewidth=LW_RESIDUAL, linestyle="--",
                 label="First kind residual r_L(x)")
        axr.plot(xrG, rG, linewidth=LW_RESIDUAL, linestyle="--",
                 label="First kind residual r_G(x)")

        eMax = max(eLmax, eGmax)
        if eMax <= 0:
            eMax = 1e-12
        axr.set_ylim(-eMax, eMax)

    ax.set_title("First-kind comparison: f(x), interpolants, nodes, and residuals")
    ax.set_xlabel("x")
    ax.set_ylabel("value")
    ax.grid(True, linewidth=GRID_LW, alpha=GRID_ALPHA)
    axr.yaxis.set_major_formatter(make_sci_formatter(digits=2))
    ax.tick_params(axis="x", pad=6)

    fig.subplots_adjust(bottom=0.10, top=0.92, right=0.87)

    # ----- legend -----
    h1, l1 = ax.get_legend_handles_labels()
    h2, l2 = axr.get_legend_handles_labels()
    handles = h1 + h2
    labels = l1 + l2

    ax_leg.legend(
        handles, labels,
        loc="upper right",
        bbox_to_anchor=(1.0, 1.0),
        frameon=True,
        fontsize=LEGEND_FS,
        borderaxespad=0.0,
        handlelength=2.0
    )
    ax_leg.set_anchor("E")

    # ---- table ----
    rows = [
        [r"First kind Lobatto max $|r_L(x)|$", sci_mathtext(eLmax, digits=3) if eLmax > 0 else r"$\mathrm{n/a}$"],
        [r"First kind Gauss max $|r_G(x)|$",   sci_mathtext(eGmax, digits=3) if eGmax > 0 else r"$\mathrm{n/a}$"],
        ["More accurate method", winner],
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
    table.scale(1.0, 1.12)

    for (r, c), cell in table.get_celld().items():
        if c == 0:
            cell.set_width(METRIC_W)
        elif c == 1:
            cell.set_width(VALUE_W)

    plt.show()

if __name__ == "__main__":
    plot_first_kind_comparison(prefix="compare_", folder=SCRIPT_DIR, show_errors=True)
