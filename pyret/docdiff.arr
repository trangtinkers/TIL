use context starter2024

fun overlap(doc1 :: List<String>, doc2 :: List<String>)-> Number:
  doc: "Consumes two lists of strings returns the overlap score"

  fun vectorize(l1 :: List<String>, l2 :: List<String>)-> List<Number>:
    doc: "Returns document l1 as a vector of size l2"
    # map over l2, filter l1 for number of occurrences, return length
    map(lam(x): filter(lam(y): if x == y: true else: false end end, l1).length() end, l2)
  end

  fun dot-product(v1 :: List<Number>, v2 :: List<Number>)-> Number:
    doc: "Dot product of two vectors"
    # multiply each elt, fold the result using addition
    map2(lam(x, y): x * y end, v1, v2).foldl(lam(acc, z): acc + z end, 0)
  end

  doc1-lower = map(string-tolower, doc1)
  doc2-lower = map(string-tolower, doc2)
  all-words = sort(distinct(doc1-lower + doc2-lower))
  vec1 = vectorize(doc1-lower, all-words)
  vec2 = vectorize(doc2-lower, all-words)
  (dot-product(vec1, vec2)
      / (num-max(dot-product(vec1, vec1), dot-product(vec2, vec2))))
where:
  # these examples taken from the Examplar paper
  overlap([list: "welcome", "to", "Walmart"], 
    [list: "WELCOME", "To", "walmart"]) is-roughly 3/3
  overlap([list: "1", "!", "A", "?", "b"], 
    [list: "1", "A", "b"]) is-roughly 3/5
  overlap([list: "alakazam", "abra"],
    [list: "abra", "kadabra", "alakazam", "abra"]) is-roughly 2/4
  overlap([list: "a", "b"], [list: "c"]) is 0/3
end

