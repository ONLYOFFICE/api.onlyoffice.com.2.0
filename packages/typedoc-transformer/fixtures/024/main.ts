/**
 * Description of the first overload.
 */
function f(p: string): void

/**
 * Description of the second overload.
 */
function f(p: number): void

function f(p: null): void

function f(p: string | number | null): void {}
