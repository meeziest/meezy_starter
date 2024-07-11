class WebOAuthConfigs {
  final OAuthConfig spotify;
  final OAuthConfig? google;

  WebOAuthConfigs({
    required this.spotify,
    this.google,
  });
}

class OAuthConfig {
  final String authority;
  final String path;
  final String clientID;
  final String redirectURL;
  final String scheme;
  final String? scope;
  final String? state;

  OAuthConfig({
    required this.authority,
    required this.path,
    required this.clientID,
    required this.redirectURL,
    required this.scheme,
    this.scope,
    this.state,
  });

  Uri get uri => Uri.https(
        authority,
        path,
        {
          'response_type': 'code',
          'client_id': clientID,
          'redirect_uri': redirectURL,
          if (scope != null) 'scope': scope,
          if (state != null) 'state': state,
        },
      );
}
