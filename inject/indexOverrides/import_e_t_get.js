(t) => {
    let hxhpush = (val) => {
        // let val = t-10000
        const before1 = hxh_state.microcode.at(-1);
        if(before1 == 123123){val = val + 0.1;hxh_state.microcode.pop();}
        else if(before1 == 456456){val = val + 0.2;hxh_state.microcode.pop();}
        else if(before1 == 789789){val = val + 0.3;hxh_state.microcode.pop();}
        hxh_state.microcode.push(val);
        // console.log("hxh val",val);
    };

    let MICROCODE_OFFSET = 10000; //deprecated...?

    let PARSE_NUM = 9999;
    let RESET_NUM = 9998;
    let EXTEND_LITERALS_ON = 9997;
    let EXTEND_LITERALS_OFF = 9996;
    let EXTEND_LITERALS_STATUS = 9995;
    let CLEAR_MICROCODE = 9994;
    if(t == RESET_NUM){
        hxh_state.reset();
        // console.log("hxh reset");
    }
    else if(t == CLEAR_MICROCODE){
        hxh_state.clear_microcode();
    }
    else if(t == EXTEND_LITERALS_ON){
        hxh_state.extended_literals = true;
    }
    else if(t == EXTEND_LITERALS_OFF){
        hxh_state.extended_literals = false;
    }
    else if(t == EXTEND_LITERALS_STATUS){
        return hxh_state.extended_literals ? TRUE : FALSE;
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
    }
    //this goes after parsing :P...
    else if(hxh_state.extended_literals){
        hxhpush(t);
    }
    else if(t>=MICROCODE_OFFSET){ // note, only supports values >= MICROCODE_OFFSET
        let val = t-MICROCODE_OFFSET;
        hxhpush(val);
    }

    return e[t];
}