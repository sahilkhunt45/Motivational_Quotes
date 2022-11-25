class Quotes {
  final List allQuotes;

  Quotes({
    required this.allQuotes,
  });

  factory Quotes.fromJson({required Map json}) {
    return Quotes(
      allQuotes: json['results'],
    );
  }
}

class LifeQuotes {
  final List lifeQuotes;

  LifeQuotes({
    required this.lifeQuotes,
  });

  factory LifeQuotes.fromJson({required Map json}) {
    return LifeQuotes(
      lifeQuotes: json['results'],
    );
  }
}

class LoveQuotes {
  final List loveQuotes;

  LoveQuotes({
    required this.loveQuotes,
  });

  factory LoveQuotes.fromJson({required Map json}) {
    return LoveQuotes(
      loveQuotes: json['results'],
    );
  }
}

class SuccessQuotes {
  final List successQuotes;

  SuccessQuotes({
    required this.successQuotes,
  });

  factory SuccessQuotes.fromJson({required Map json}) {
    return SuccessQuotes(
      successQuotes: json['results'],
    );
  }
}

class AuthorQuotes1 {
  final List authorQuotes1;

  AuthorQuotes1({
    required this.authorQuotes1,
  });

  factory AuthorQuotes1.fromJson({required Map json}) {
    return AuthorQuotes1(
      authorQuotes1: json['results'],
    );
  }
}

class AuthorQuotes2 {
  final List authorQuotes2;

  AuthorQuotes2({
    required this.authorQuotes2,
  });

  factory AuthorQuotes2.fromJson({required Map json}) {
    return AuthorQuotes2(
      authorQuotes2: json['results'],
    );
  }
}

class AuthorQuotes3 {
  final List authorQuotes3;

  AuthorQuotes3({
    required this.authorQuotes3,
  });

  factory AuthorQuotes3.fromJson({required Map json}) {
    return AuthorQuotes3(
      authorQuotes3: json['results'],
    );
  }
}

class AuthorQuotes4 {
  final List authorQuotes4;

  AuthorQuotes4({
    required this.authorQuotes4,
  });

  factory AuthorQuotes4.fromJson({required Map json}) {
    return AuthorQuotes4(
      authorQuotes4: json['results'],
    );
  }
}
