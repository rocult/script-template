# Usage

All of your code should go inside the [src](https://github.com/rocult/script-template/tree/main/src) folder.
If you look inside, there are a few folders there for you already.
Next, I will explain the purpose of each one.
Note that you don't have to stick to this structure, you can deviate away, if you're comfortable with that.

- [src/init.luau](./USAGE_SRC_INIT.md)
- [src/core](./USAGE_SRC_CORE.md)
- [src/modules](./USAGE_SRC_MODULES.md)
- [src/types](./USAGE_SRC_TYPES.md)

Remember that all files must return something.
If your file does not return anything, just make it return `return true`, or anything really.
You can also remove the example files in each folder, if you want to.

## Building

Once you're ready to build, test and release your script, you can run `./build.bat` or the command manually inside of [build.bat](https://github.com/rocult/script-template/blob/main/build.bat)
