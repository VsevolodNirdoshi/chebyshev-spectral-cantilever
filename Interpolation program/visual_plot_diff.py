import os
import math
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.ticker import FuncFormatter
from matplotlib.gridspec import GridSpec

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
DEFAULT_FILE = os.path.join(SCRIPT_DIR, "diff_results_.csv")


def _to_float(s: str) -> float:
    s = s.strip()
    if not s:
        raise ValueError("Empty numeric field")
    s = s.replace(",", ".")
    return float(s)


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


def read_diff_csv(path: str):
    """
    Reads Delphi-exported diff_results_.csv (the fixed file).

    Expected format:
      N,<int>
      Method,<text>
      Node,f(x),df/dx (numerical),df/dx (analytical),Error
      ...

    Returns: N, method, arrays: x, fx, dnum, dan, err
    """
    if not os.path.exists(path):
        raise FileNotFoundError(f"Cannot find file: {path}")

    N = None
    method = None

    xs, fx, dnum, dan, err = [], [], [], [], []

    with open(path, "r", encoding="utf-8-sig") as f:
        lines = [ln.strip() for ln in f if ln.strip()]

    # Read meta lines if present
    idx = 0
    if lines and lines[0].lower().startswith("n,"):
        parts = lines[0].split(",", 1)
        if len(parts) == 2:
            try:
                N = int(parts[1].strip())
            except ValueError:
                N = None
        idx += 1

    if idx < len(lines) and lines[idx].lower().startswith("method,"):
        method = lines[idx].split(",", 1)[1].strip() if "," in lines[idx] else None
        idx += 1

    # Skip header if present
    if idx < len(lines) and lines[idx].lower().startswith("node"):
        idx += 1

    # Data
    for ln in lines[idx:]:
        delim = ";" if ";" in ln else ","
        parts = [p.strip() for p in ln.split(delim)]
        if len(parts) < 5:
            continue
        try:
            xs.append(_to_float(parts[0]))
            fx.append(_to_float(parts[1]))
            dnum.append(_to_float(parts[2]))
            dan.append(_to_float(parts[3]))
            err.append(_to_float(parts[4]))
        except ValueError:
            continue

    return N, method, np.array(xs), np.array(fx), np.array(dnum), np.array(dan), np.array(err)


def plot_differentiation(csv_path: str = DEFAULT_FILE):
    # ==================== STYLE CONTROLS ====================
    LW_ANALYTICAL = 1.2
    LW_NUMERICAL  = 1.2
    LW_ERROR      = 0.9
    NODE_SIZE     = 40

    GRID_LW       = 0.8
    GRID_ALPHA    = 0.7

    # ==================== READ ====================
    N, method, x, fx, dnum, dan, err = read_diff_csv(csv_path)

    if x.size == 0:
        raise RuntimeError("CSV contains no data rows.")

    # Metrics
    max_err = float(np.max(np.abs(err))) if err.size else 0.0
    rms_err = float(math.sqrt(float(np.mean(err * err)))) if err.size else 0.0

    # ==================== LAYOUT (top plot + bottom [table | legend]) ====================
    fig = plt.figure(figsize=(12, 7))

    gs_outer = GridSpec(
        nrows=2, ncols=1,
        height_ratios=[6.2, 1.15],
        hspace=0.18,
        figure=fig
    )

    ax = fig.add_subplot(gs_outer[0])
    axr = ax.twinx()
    axr.set_ylabel("Error", color="red")
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

    # ==================== PLOT ====================
    # Left axis: derivatives
    ax.plot(x, dan, linewidth=LW_ANALYTICAL, label="Analytical derivative")
    ax.plot(x, dnum, linewidth=LW_NUMERICAL, label="Numerical derivative")
    ax.scatter(x, dnum, s=NODE_SIZE, label=f"Numerical at nodes (N={N})" if N is not None else "Numerical at nodes")

    # Right axis: error curve
    axr.plot(x, err, linewidth=LW_ERROR, linestyle="--", label="Error")

    # Scale right axis nicely
    emax = float(np.max(err)) if err.size else 0.0
    if emax <= 0:
        emax = 1e-12
    axr.set_ylim(0.0, emax * 1.2)

    # Labels / title
    title_parts = ["Chebyshev Differentiation"]
    if method:
        title_parts.append(method)
    if N is not None:
        title_parts.append(f"N={N}")
    ax.set_title(" — ".join(title_parts))

    ax.set_xlabel("x")
    ax.set_ylabel("value")
    ax.grid(True, linewidth=GRID_LW, alpha=GRID_ALPHA)
    axr.yaxis.set_major_formatter(make_sci_formatter(digits=2))

    fig.subplots_adjust(bottom=0.10, top=0.92, right=0.87)

    # ==================== LEGEND ====================
    h1, l1 = ax.get_legend_handles_labels()
    h2, l2 = axr.get_legend_handles_labels()
    handles = h1 + h2
    labels = l1 + l2

    ax_leg.legend(
        handles, labels,
        loc="upper right",
        bbox_to_anchor=(1.0, 1.0),
        frameon=True,
        fontsize=9,
        borderaxespad=0.0,
        handlelength=2.0,
        ncol=1
    )
    ax_leg.set_anchor("E")

    # ==================== TABLE ====================
    method_text = method if method else "—"
    N_text = str(N) if N is not None else "—"

    rows = [
        ["Method", method_text],
        ["N", N_text],
        [r"Max Error", sci_mathtext(max_err, digits=3) if max_err > 0 else r"$0$"],
        [r"RMS Error", sci_mathtext(rms_err, digits=3) if rms_err > 0 else r"$0$"],
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

    # Column widths (similar feel to your comparison scripts)
    for (r, c), cell in table.get_celld().items():
        if c == 0:
            cell.set_width(0.55)
        elif c == 1:
            cell.set_width(0.45)

    plt.show()


if __name__ == "__main__":
    plot_differentiation(DEFAULT_FILE)
