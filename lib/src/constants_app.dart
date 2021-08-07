class Environment {
  static const Dev = "dev";
  static const Production = "production";
}

class ConstantsApp {
  static const ENVIRONMENT = Environment.Production;

  static const URL_HTTP = (ENVIRONMENT == Environment.Dev)
      ? "https://restcountries.eu/rest/v2"
      : "https://restcountries.eu/rest/v2";
}
