// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

// $> ln ~/Development/GitHub/Environment/HyperJS/.hyper.js ~/.hyper.js

module.exports = {
    config: {
        // Choose either "stable" for receiving highly polished,
        // or "canary" for less polished but more frequent updates
        updateChannel: 'stable',

        // default font size in pixels for all tabs
        fontSize: 24,

        // font family with optional fallbacks
        fontFamily:
            '"Monofur Nerd Font", "Fira Code", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

        // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
        cursorColor: '#FF443E',

        // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
        cursorShape: 'BLOCK',

        // set to true for blinking cursor
        cursorBlink: true,

        // color of the text
        foregroundColor: '#FFF',

        // terminal background color
        backgroundColor: '#252525',

        // border color (window, tabs)
        borderColor: '#2979FF',

        // custom css to embed in the main window
        css: '',

        // custom css to embed in the terminal window
        termCSS: `
            .unicode-node {
               display: inline !important;
            }
        `,

        // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
        // default: `false` on Linux, `true` on Windows (ignored on macOS)
        showHamburgerMenu: '',

        // set to `false` if you want to hide the minimize, maximize and close buttons
        // additionally, set to `'left'` if you want them on the left, like in Ubuntu
        // default: `true` on windows and Linux (ignored on macOS)
        showWindowControls: '',

        // custom padding (css format, i.e.: `top right bottom left`)
        padding: '12px 14px',

        // size of window by pixels (width, height)
        windowSize: [1200, 600],

        // the full list. if you're going to provide the full color palette,
        // including the 6 x 6 color cubes and the grayscale map, just provide
        // an array here instead of a color map object
        colors: {
            black: '#2C2C2C',
            red: '#FF443E',
            green: '#04D82C',
            yellow: '#FFC135',
            blue: '#42A5F5',
            magenta: '#D81B60',
            cyan: '#00ACC1',
            white: '#F5F5F5',
            lightBlack: '#5D6F71',
            lightRed: '#FF443E',
            lightGreen: '#04F968',
            lightYellow: '#FFF035',
            lightBlue: '#42C7F5',
            lightMagenta: '#D81B60',
            lightCyan: '#00ACC1',
            lightWhite: '#F5F5F5'
        },

        // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
        // if left empty, your system's login shell will be used by default
        //
        // Windows
        // - Make sure to use a full path if the binary name doesn't work
        // - Remove `--login` in shellArgs
        //
        // Bash on Windows
        // - Example: `C:\\Windows\\System32\\bash.exe`
        //
        // Powershell on Windows
        // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
        shell: '',

        // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
        // by default ['--login'] will be used
        shellArgs: ['--login'],

        // for environment variables
        env: {
            HYPER_SHELL: true
        },

        // set to false for no bell
        bell: false,

        // if true, selected text will automatically be copied to the clipboard
        copyOnSelect: false,

        // if true, on right click selected text will be copied or pasted if no
        // selection is present (true by default on Windows)
        // quickEdit: true

        // URL to custom bell
        // bellSoundURL: 'http://example.com/bell.mp3',

        // for advanced config flags please refer to https://hyper.is/#cfg

        // Plugins Settings
        hyperTabs: {
            trafficButtons: false,
            border: false,
            tabIconsColored: true,
            activityColor: 'salmon',
            closeAlign: 'right',
            activityPulse: true
        },

        hyperBorder: {
            // borderColors: ['random','random'],
            borderWidth: '5px'
        },

        gruvboxTheme: {
            style: 'dark', // or 'light'
            contrast: 'normal' // or 'soft', 'hard'
        }
    },

    // a list of plugins to fetch and install from npm
    // format: [@org/]project[#version]
    // examples:
    //   `hyperpower`
    //   `@company/project`
    //   `project#1.0.1`
    plugins: [
        // 'hyperpower',
        'hyperborder',
        'hyper-statusline',
        'hyper-tabs-enhanced',
        'hyper-dark-scrollbar',
        'hypergoogle',
        'gitrocket',
        'hypergravity',
        'space-pull',
        'hyper-materialshell'
        // 'hyperterm-gruvbox',
        // 'hyperterm-panda',
        // 'hyperterm-monokai',
        // 'hyper-peacock',
        // 'hyper-one-dark-vivid',
        // 'hyper-frontend-delight',
        // 'hyper-snazzy',
        // 'hyper-chesterish',
        // 'hyper-one-light',
    ],

    // in development, you can create a directory under
    // `~/.hyper_plugins/local/` and include it here
    // to load it and avoid it being `npm install`ed
    localPlugins: [],

    keymaps: {
        // Example
        // 'window:devtools': 'cmd+alt+o',
    }
}
