import 'package:http/http.dart' as http;

import 'client.dart';
import 'model/model.dart';

/// Provides access to resources related to [User].
///
/// See: [Unsplash docs](https://unsplash.com/documentation#current-user)
class CurrentUser {
  /// Creates a new instance which belongs to [client].
  CurrentUser(this.client) : baseUrl = client.baseUrl;

  /// The parent [UnsplashClient].
  final UnsplashClient client;

  /// The base url for all endpoints for [User].
  final Uri baseUrl;

  /// Get the user’s profile
  ///
  /// See: [Unsplash docs](https://unsplash.com/documentation#get-the-users-profile)
  Request<User> me() {
    final url = baseUrl.resolve('me');

    return Request(
      client: client,
      httpRequest: http.Request('GET', url),
      isPublicAction: false,
      bodyDeserializer: (dynamic json) =>
          User.fromJson(json as Map<String, dynamic>),
    );
  }

}
