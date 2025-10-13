var hxh_state = {
    microcode: [],
    memory: new Map(),

    reset: () => {
    hxh_state.microcode = [];
    hxh_state.memory = new Map();
    },
    // currentInstruction: -1,
};