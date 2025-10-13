(e, t, a, o) => {
    var thing = d.decode(r().subarray(e, e + t));
    if(thing.includes("Stop") || thing.includes("trick")){
        console.log("WHAT THE SIGMA");
        return;
    }
    console.log(
        d.decode(r().subarray(e, e + t)),
        d.decode(r().subarray(a, a + o)),
    );
}