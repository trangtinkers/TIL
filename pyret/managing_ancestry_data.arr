use context dcic2024

ancestors = table: name, birthyear, eyecolor, female-parent, male-parent
  row: "Anna", 1997, "blue", "Susan", "Charlie"
  row: "Susan", 1971, "blue", "Ellen", "Bill"
  row: "Charlie", 1972, "green", "", ""
  row: "Ellen", 1945, "brown", "Laura", "John"
  row: "John", 1922, "brown", "", "Robert"
  row: "Laura", 1922, "brown", "", ""
  row: "Robert", 1895, "blue", "", ""
end

fun parents-of(anc-table :: Table, who :: String) -> List<String>:
  doc: "Return list of names of known parents of given name"
  matches = filter-with(anc-table, lam(r): r["name"] == who end)
  if matches.length() > 0:
    person-row = matches.row-n(0)
    names =
     [list: person-row["female-parent"],
       person-row["male-parent"]]
    L.filter(lam(n): not(n == "") end, names)
  else:
    raise("No such person " + who)
  end
where:
  parents-of(ancestors, "Anna") is [list: "Susan", "Charlie"]
  parents-of(ancestors, "John") is [list: "Robert"]
  parents-of(ancestors, "Robert") is empty
  parents-of(ancestors, "Kathi") raises "No such person"
end