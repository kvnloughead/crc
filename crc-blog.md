After creating new React components manually for the umpteenth time I decided that the process could be automated a bit. We have CRA for React _apps_. Why not CRC, for React components. If there already is such a utility, feel free to keep it to yourself.

I considered writing it in Python, but instead decided to write a bash script. Writing bash scripts is a bit of an acquired taste. The Bash shell itself is 30 year old tech, and many of its the bread and butter commands date back to the dawn of Unix in the early 70's -- if not earlier. So you might miss out on some of smoothness and hand-holding of a modern language like Python or JavaScript. But it is still a powerful tool with many applications, and gaining some familiarity with it is well worth your while. And for any retro computing or history of computation geeks out there, playing around with bash is a great hobby. So bash it is.

If you are completely unfamiliar with bash, or need a brush up, consider reading my article on bash aliases and functions first. It covers more of the basics.

Let's start by describing the goal of this program, and some of the assumptions that will be made. At its most basic, if we type this in the console

```bash
$ crc Header
```

`crc` will create for us a file structure like this in the current working directory

```
. 
|____ Header/
           |______ Header.jsx
           |______ styles.css
```

And inside `Header.jsx` the following boilerplate code will be added:

```jsx
import React from 'react';

const Header = () => {
  return (
    <></>
  );
};

export default Header;
```

Of course, this is just one of the many possible styles of writing React components. Class components, css-modules... these will go on our TODO list. But we will be implementing an option to use styled-components, because that is what I have been using lately. The difference here won't be so great, really. Instead of `styles.css`, we need `styles.js`. And we will add a few import statements to the files so we don't have to type them every time. We'll go into that in more detail when the time comes.

So that describes what our script will do. Now it's time to get down to work. First, we need to create a script and make it executable. We will create it in our `~/bin` directory, where `~` refers to the user directory. Depending on what system you are running, this directory may or may not exist already. If it doesn't, feel free to create it. We will store all of our executable (aka "_bin_ary") files here. If you create this directory yourself, you will have to instruct your OS to look there when looking for commands to execute. Otherwise it won't find your program when try to run it. To do this, first open your `~/.bashrc` file in an editor. This is where many of your user settings for bash are stored. If you search it for the string `PATH` and you see a line that looks like this

```bash
export PATH="$HOME/bin:$PATH"
```

then your `~/bin` directory is already on the "PATH" that your OS will follow when looking for executables. If not, add that line somewhere. You might want to mark off a section for settings that you enter yourself, to help you distinguish between it and the initial settings. 


