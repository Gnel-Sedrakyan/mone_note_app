class NoCachedValueError extends Error {}

class GpsNotEnabledError extends Error {
  @override
  String toString() {
    const explanation = 'GPS is not enabled. Terminating.';
    return Error.safeToString(explanation);
  }
}
