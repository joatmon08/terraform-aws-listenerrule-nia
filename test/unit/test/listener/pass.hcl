mock "tfplan/v2" {
  module {
    source = "../testdata/mock-tfplan-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
