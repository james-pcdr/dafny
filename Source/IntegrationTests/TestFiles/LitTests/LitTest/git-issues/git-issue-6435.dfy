// RUN: %exits-with 5 %stdin "function f(): int\n{\n0\n}" %baredafny format --check --stdin
// RUN: %exits-with 0 %stdin "function f(): int {\n  0\n}" %baredafny format --check --stdin

// Also verify --print produces the correctly formatted output.
// RUN: %exits-with 0 %stdin "function f(): int\n{\n0\n}\n" %baredafny format --print --stdin > "%t"
// RUN: %diff "%s.expect" "%t"

// Regression test: format --stdin did not format because (1) Console.In was
// already consumed, (2) GetFirstTokenForUri used stdin URI instead of temp
// file URI, and (3) IndentationFormatter used stdin URI instead of temp file URI.
