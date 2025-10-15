(t) => {
    let PARSE_NUM = 9999;
    let RESET_NUM = 9998;
    let MICROCODE_OFFSET = 10000;
    if(t == RESET_NUM){
        hxh_state.reset();
        // console.log("hxh reset");
    }
    else if(t == PARSE_NUM){ // parse and "execute" microcode
        // console.log("parse num",t);
        switch(hxh_state.microcode.shift()){
        case 0: // console.log the rest
            console.log(Array.from(hxh_state.microcode));
            break;
        case 1: // return memory[microcode[0]]
            let value = hxh_state.memory[hxh_state.microcode.shift()];
            return value || 0;
        case 2: // memory[microcode[0]] = microcode[1]
            hxh_state.memory[hxh_state.microcode[0]] = hxh_state.microcode[1];
            break;
        case 3: // console.log the rest as a charcode thing
            var temp = []
            Array.from(hxh_state.microcode).forEach(function(a, index) {
            temp.push(String.fromCharCode(a))
            });
            console.log(temp.join(""));
            break;
        case 4: // window.poop = 1
            window.poop = 1;
            break;
        case 5: // window.poop = null
            window.poop = null;
            break;
        case 6: // breakpoint
            debugger;
            break;
        case 7: // reset
            hxh_state.reset();
            break;
        }
        hxh_state.microcode = [];
    }else if(t>=MICROCODE_OFFSET){
        let val = t-10000
        if(hxh_state.microcode.at(-1) == 123123){val = val + 0.1;hxh_state.microcode.pop();}
        else if(hxh_state.microcode.at(-1) == 456456){val = val + 0.2;hxh_state.microcode.pop();}
        else if(hxh_state.microcode.at(-1) == 789789){val = val + 0.3;hxh_state.microcode.pop();}
        hxh_state.microcode.push(val);
        // console.log("hxh val",val);
    }

    return e[t];
}