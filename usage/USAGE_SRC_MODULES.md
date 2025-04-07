# Usage - [src/modules](https://github.com/rocult/script-template/tree/main/src/modules)

The rest of your files can go here. If a file starts to rather large, follow these steps:
1. Make a folder called the same thing as the file
2. Inside the folder, make a file called `init.luau` and put the code into there
3. From there, split the code into many files and place those files into the folder we just made.
4. You can then require those files into the `init.luau` file inside of the folder we just made, **not** the [entrypoint file](https://github.com/rocult/script-template/blob/main/src/init.luau).
