# crc - Create React Component

A command line utility to create boilerplate for a React component. Use it inside your components directory.

### USAGE
```bash
crc component-name [OPTIONS]  
```

### POSITIONAL PARAMETERS
| `component-name`  is the name of the component       
    

### OPTIONS

`-s | --style` | The type of styling being used. Defaults to vanilla css. Options: `sc` for styled-components.

### DESCRIPTION
  Creates a file structure like this inside the `cwd`
    
    cwd 
      |____ component-name/
                          |______ component-name.jsx
                          |______ styles.css

  Fills jsx file with boilerplate found in the crc-templates directory.
  If `-s sc` option is set, replaces styles.css with styles.js and 
  adds a few necessary import statements for working with styled-components.
  
### TODO

1. add a `-m` option, to list modules for import
2. add a `-c` flag to create class component instead 
3. support css-modules with a `-s cm` option
