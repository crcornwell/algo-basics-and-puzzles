module.exports = ({ entry }) => {
  const [ fullPath, rel, dir, name, ext ] = entry.match(/(\.\/)?(.*\/)([^\/.]+)(\..+)$/);
  const relPath = `${dir}${name}${ext}`;
  const config = {
    entry: `./${relPath}`,
    output: {
      path: __dirname + '/dist',
      filename: relPath
    },
    node: {
      fs: 'empty'
    }
  };
  console.log(':: config ::', config);
  return config;
};
