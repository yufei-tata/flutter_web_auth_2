/// Default intent flags for opening the custom tabs intent on Android.
/// This is essentially the same as
/// `FLAG_ACTIVITY_SINGLE_TOP | FLAG_ACTIVITY_NEW_TASK`.
const defaultIntentFlags = 1 << 29 | 1 << 28;

/// "Ephemeral" intent flags for opening the custom tabs intent on Android.
/// This is essentially the same as
/// `FLAG_ACTIVITY_SINGLE_TOP | FLAG_ACTIVITY_NEW_TASK
/// | FLAG_ACTIVITY_NO_HISTORY`.
const ephemeralIntentFlags = defaultIntentFlags | 1 << 30;

class FlutterWebAuth2Options {
  /// **Only has an effect on iOS and MacOS!**
  /// If this is `true`, an ephemeral web browser session
  /// will be used where possible (`prefersEphemeralWebBrowserSession`).
  final bool preferEphemeral;

  /// **Only has an effect on Web!**
  /// Can be used to override the origin of the redirect URL.
  /// This is useful for cases where the redirect URL is not on the same
  /// domain (e.g. local testing).
  final String? debugOrigin;

  /// **Only has an effect on Android!**
  /// Can be used to configure the intent flags for the custom tabs intent.
  /// Possible values can be found
  /// [here](https://developer.android.com/reference/android/content/Intent#setFlags(int)).
  /// Use [ephemeralIntentFlags] if you want similar behaviour to
  /// [preferEphemeral] on Android.
  final int intentFlags;

  /// **Only has an effect on Web!**
  /// Can be used to pass a window name for the URL open call.
  /// See [here](https://www.w3schools.com/jsref/met_win_open.asp) for
  /// possible parameter values.
  final String? windowName;

  /// **Only has an effect on Linux, Web and Windows!**
  /// Can be used to specify a timeout in seconds when the authentication shall
  /// be deemed unsuccessful. An error will be thrown in order to abort the
  /// authentication process.
  final int timeout;

  const FlutterWebAuth2Options({
    this.preferEphemeral = false,
    this.debugOrigin,
    this.intentFlags = defaultIntentFlags,
    this.windowName,
    this.timeout = 5 * 60,
  });

  FlutterWebAuth2Options.fromJson(Map<String, dynamic> json)
      : preferEphemeral = json['preferEphemeral'],
        debugOrigin = json['debugOrigin'],
        intentFlags = json['intentFlags'],
        windowName = json['windowName'],
        timeout = json['timeout'];

  Map<String, dynamic> toJson() => {
        'preferEphemeral': preferEphemeral,
        'debugOrigin': debugOrigin,
        'intentFlags': intentFlags,
        'windowName': windowName,
        'timeout': timeout,
      };
}
