/** @type {import("prettier").Config} */
module.exports = {
  singleQuote: true,
  printWidth: 100,
  trailingComma: 'all',
  overrides: [
    {
      files: '*.html',
      options: {
        parser: 'angular',
      },
    },
  ],
};
