# Unhandled Exception in Asynchronous Dart Code

This example showcases a common issue in asynchronous Dart code: inadequate exception handling. The `fetchData` function attempts to retrieve data from an API. While it includes a `try-catch` block, the exception handling is basic.  Improving the error handling will lead to more robust and maintainable code.

## Bug

The provided code handles exceptions with a generic `catch (e)`. This makes debugging difficult, as the specific nature of the error isn't captured. The rethrow is helpful for higher-level error handling but lacks detailed context.

## Solution

The solution focuses on providing more informative error handling, allowing for better debugging and more graceful error recovery.  Specific error types are caught, and contextual information is logged.