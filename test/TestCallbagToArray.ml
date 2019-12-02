open BsMocha
let describe, it = Mocha.(describe, it);;

describe "CallbagToArray" (fun () -> begin

  it "should convert a sync pullable source into an array" (fun () -> begin
    let open CallbagBasics
    in
    let result =
      from_array [|1;2;3;4;5|]
      |> filter ((>) 3)
      |> map (( * ) 2)
      |> CallbagToArray.to_array
    in
    Assert.deep_equal result [|2; 4|]
  end)
end)
