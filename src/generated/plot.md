# Module `plot`

`plot`: 2D plotting helpers (spec §18.4).

The `@builtin` declarations below are signature-only; each binds to the Rust-hosted
implementation registered under `plot::<name>`. Plotting accumulates state until
`savefig`/`show`; the optional trailing series arguments are declared as required here and the
implementation fills defaults when a call omits them.

Add a line series through the points `(x, y)` to the current figure.

## `pub fn plot(x: Array<F64>, y: Array<F64>, label: String, color: String)`

Add a scatter series of the points `(x, y)` to the current figure.

## `pub fn scatter(x: Array<F64>, y: Array<F64>, label: String, marker: String)`

Add a line series through `(x, y)` with an explicit line style.

## `pub fn line(x: Array<F64>, y: Array<F64>, label: String, linestyle: String)`

Add a bar series with the given `x` positions and heights `y`.

## `pub fn bar(x: Array<F64>, y: Array<F64>, label: String)`

Set the x-axis label.

## `pub fn xlabel(text: String)`

Set the y-axis label.

## `pub fn ylabel(text: String)`

Set the figure title.

## `pub fn title(text: String)`

Show the legend at the given `location` (e.g. `"upper right"`).

## `pub fn legend(location: String)`

Set the x-axis limits to `[min, max]`.

## `pub fn xlim(min: F64, max: F64)`

Set the y-axis limits to `[min, max]`.

## `pub fn ylim(min: F64, max: F64)`

Toggle the grid on (`visible = true`) or off.

## `pub fn grid(visible: Bool)`

Write the current figure to `filename` in the given `format` at `dpi`.

## `pub fn savefig(filename: String, format: String, dpi: Integer)`

Render and display the accumulated figure.

## `pub fn show()`

Reset the plotting state, starting a fresh figure.

## `pub fn clear()`

