var hxh_state = {
    microcode: [],
    memory: new Map(),
    extended_literals: false,

    reset: () => {
        hxh_state.microcode = [];
        hxh_state.memory = new Map();
        hxh_state.extended_literals = false;
    },

    clear_microcode: () => {
        hxh_state.microcode = [];
    },
    // currentInstruction: -1,
};

let TRUE = 1;
let FALSE = 0;