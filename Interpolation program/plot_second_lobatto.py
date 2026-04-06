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

def read_meta(path: str):
    meta = {}
    with open(path, "r", encoding="utf-8-sig") as f:
        for line in f:
            line = line.strip()
            if not line or "=" not in line:
                continue
            k, v = line.split("=", 1)
            meta[k.strip()] = v.strip()
    return meta

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

def plot_second_lobatto(prefix="second_lobatto_", folder="."):
    METRIC_W = 0.42
    VALUE_W  = 0.75

    LW_FUNC     = 1.2
    LW_INTERP   = 1.2
    LW_RESIDUAL = 0.9
    NODE_SIZE   = 40
    GRID_LW     = 0.8
    GRID_ALPHA  = 0.7
    LEGEND_FS   = 9

    f_path     = os.path.join(folder, f"{prefix}f.csv")
    u_path     = os.path.join(folder, f"{prefix}u.csv")
    nodes_path = os.path.join(folder, f"{prefix}nodes.csv")
    r_path     = os.path.join(folder, f"{prefix}r.csv")
    meta_path  = os.path.join(folder, f"{prefix}meta.txt")

    xf, yf = read_xy_csv(f_path)
    xu, yu = read_xy_csv(u_path)
    xn, yn = read_xy_csv(nodes_path)
    xr, yr = read_xy_csv(r_path)
    meta = read_meta(meta_path)

    basis_name = "Chebyshev polynomials of the second kind"
    node_set_name = "Chebyshev nodes of the second kind"
    function_name = meta.get("function_name", "f(x)")
    nodes_count = meta.get("nodes_count", "n/a")

    rmax = float(np.max(np.abs(yr))) if yr.size else 0.0

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

    ax.plot(xf, yf, linewidth=LW_FUNC, label="Original function f(x)")
    ax.plot(xu, yu, linewidth=LW_INTERP, label="Interpolant u(x)")
    ax.scatter(xn, yn, s=NODE_SIZE, label="Chebyshev nodes of the second kind")

    axr.plot(xr, yr, linewidth=LW_RESIDUAL, linestyle="--",
             label="Residual r(x)")

    emax = max(rmax, 1e-12)
    axr.set_ylim(-emax, emax)

    ax.set_title(f"{basis_name} with {node_set_name}")
    ax.set_xlabel("x")
    ax.set_ylabel("value")
    ax.grid(True, linewidth=GRID_LW, alpha=GRID_ALPHA)

    axr.yaxis.set_major_formatter(make_sci_formatter(digits=2))

    fig.subplots_adjust(bottom=0.10, top=0.92, right=0.87)

    h1, l1 = ax.get_legend_handles_labels()
    h2, l2 = axr.get_legend_handles_labels()

    ax_leg.legend(
        h1 + h2, l1 + l2,
        loc="upper right",
        bbox_to_anchor=(1.0, 1.0),
        frameon=True,
        fontsize=LEGEND_FS,
        borderaxespad=0.0,
        handlelength=2.0
    )

    rows = [
        ["Basis", basis_name],
        ["Function", function_name],
        ["Node set", node_set_name],
        ["Nodes count", nodes_count],
        [r"Max residual $\max |r(x)|$", sci_mathtext(rmax, digits=3)],
    ]

    table = ax_tbl.table(
        cellText=rows,
        colLabels=["Characteristic", "Description"],
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
    plot_second_lobatto(prefix="second_lobatto_", folder=SCRIPT_DIR)