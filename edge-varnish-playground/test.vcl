backend default {
  .host = "127.0.0.1";
  .port = "80";
}

backend yahoo {
  .host = "www.yahoo.com";
  .port = "80";
}

backend yahoosports {
  .host = "98.136.145.156";
  .port = "80";
}

backend yahoonews {
  .host = "98.136.145.156";
  .port = "80";
}

sub vcl_recv {
  if(req.url ~ "\/yahoo\/") {
    set req.url = "http://www.yahoo.com/";
    set req.backend = yahoo;
  } elsif (req.url ~ "\/yahoonews\/") {
    set req.url = "http://news.yahoo.com/";
    set req.backend = yahoonews;
  } elsif (req.url ~ "\/yahoosports\/") {
    set req.url = "http://sports.yahoo.com/";
    set req.backend = yahoosports;
  } else {
    set req.backend = default;
  }
}
