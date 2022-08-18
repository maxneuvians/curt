from masonite.routes import Route

ROUTES = [
    Route.get("/", "HomeController@show").name("home").middleware("auth"),
    Route.get("/auth", "AuthController@auth").name("auth.login"),
    Route.get("/auth/callback", "AuthController@callback"),
    Route.get("/auth/logout", "AuthController@logout").name("auth.logout"),
    Route.get("/lang/@lang", "LangController@switch").name("language_switcher").middleware("auth"),
    Route.get("/healthcheck", "HealthController@show").name("healthcheck"),
    Route.get("/find_services", "FindServicesController@show").name("find_services").middleware("auth"),
    Route.get("/find_users", "FindUsersController@show").name("find_users").middleware("auth"),
    Route.get("/feedback_signup/?service", "FeedbackSignupController@show").name("feedback_signup").middleware("auth"),
]
