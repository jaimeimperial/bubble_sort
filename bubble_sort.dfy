class Sorting {
    var M: array<int>
    var start: int
    var end: int

    /*
    method sortSubarray(arr: array<int>, start: int, end: int)
        modifies test_arr
        ensures isSorted(0, this.M.Length)
    {
        this.M := copySubarray(arr, start, end);
        sort();
    }
    */
    
    method copySubarray(original: array<int>, start: int, end: int) returns (copy: array<int>)
        requires 0 <= start <= end <= original.Length
        ensures copy.Length == end - start
        ensures forall x :: 0 <= x < copy.Length ==> copy[x] == original[start + x]
    {
        copy := new int[end - start];
        for i := 0 to end - start
            invariant forall x :: 0 <= x < i ==> copy[x] == original[start + x]
        {
            copy[i] := original[i + start];
        }
    }


    method sort()
        modifies this.M
        requires 1 <= this.M.Length
        ensures isSorted(0, this.M.Length)
    {
        var i: nat := 0;
        for i := 0 to this.M.Length - 1
            invariant 0 <= i <= this.M.Length - 1
            invariant multiset(this.M[..]) == multiset(old(this.M[..]))
        {
            var A := this.M[i];
            var j: nat := i + 1;
            var B := this.M[j];
            while j < this.M.Length
                invariant j <= this.M.Length
                invariant A == this.M[i]
                invariant forall x :: i <= x < j ==> this.M[i] <= this.M[x]
                invariant multiset(this.M[..]) == multiset(old(this.M[..]))
                decreases this.M.Length - j
            {   
                B := this.M[j];
                if A > B {
                    this.M[i] := B;
                    this.M[j] := A;
                    A := B;
                } 
                j := j + 1;
            }
        }
        assert isSorted(0, this.M.Length);
    }

    predicate isSorted (x: int, y: int)
        reads this, this.M
        requires 0 <= x <= y <= this.M.Length
    {   
        if y <= 1 then true
        else forall i, j :: x <= i < j < y < this.M.Length ==> this.M[i] <= this.M[j]
    }
}

