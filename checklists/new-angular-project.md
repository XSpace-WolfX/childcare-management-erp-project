# New Angular Project Checklist

This checklist must be used when creating a new Angular frontend application for the Childcare Management ERP project.

## 1. Generate the Angular project

The Angular project must be generated with the exact Angular CLI major version selected by the engineering standards.

Do not use a globally installed Angular CLI unless its version has been checked first.

Recommended command:

```powershell
npx @angular/cli@22 new __PROJECT_NAME__ --routing --style=scss --ssr=false
```

Example:

```powershell
npx @angular/cli@22 new ChildcareManagementERP.Staff.Web --routing --style=scss --ssr=false
```

When the Angular CLI asks which AI tools should be configured, select:

- Windsurf
- GitHub Copilot

The project must use:

- Angular 22
- Routing enabled
- SCSS
- SSR disabled
- Strict TypeScript configuration
- Standalone components
- Angular AI configuration for Windsurf
- Angular AI configuration for GitHub Copilot

## 2. Apply the Angular template

Apply the files from:

```text
templates/angular/
```

The following files must be reviewed or replaced:

- `.windsurf/rules/guidelines.md`
- `.github/copilot-instructions.md`
- `package.json`
- `angular.json`
- `tsconfig.json`
- `tsconfig.app.json`
- `eslint.config.js`
- `prettier.config.js`
- `.editorconfig`
- `.prettierignore`
- `.gitignore` must be reviewed manually and must not be overwritten automatically
- `.vscode/extensions.json`
- `.vscode/settings.json`

After project creation, verify the generated versions:

```powershell
cd __PROJECT_NAME__
node -v
npm -v
npx ng version
```

Expected baseline:

- Node.js 24.x
- npm 11.x
- Angular CLI 22.x
- Angular 22.x

## 3. Replace template placeholders

Replace all template placeholders with the actual project values.

Common placeholders:

```text
__PROJECT_NAME__
__PROJECT_PREFIX__
```

Example values:

```text
__PROJECT_NAME__ = ChildcareManagementERP.Staff.Web
__PROJECT_PREFIX__ = ccm
```

## 4. Review npm scripts

The project should include at least the following scripts:

```json
{
  "start": "ng serve",
  "build": "ng build",
  "lint": "ng lint",
  "format": "prettier --write .",
  "format:check": "prettier --check .",
  "check": "npm run lint && npm run format:check"
}
```

## 5. Install dependencies

Run:

```powershell
npm install
```

## 6. Validate the project

Run:

```powershell
npm run lint
npm run format:check
npm run build
```

The project is not considered aligned until all commands pass.

## 7. Review project structure

The project should follow the standard Angular feature structure used by the Childcare Management ERP project.

Recommended structure:

```text
src/
  app/
    core/
    shared/
    features/
```

Feature-level UI components should be placed in a `ui` folder.

Avoid the `components` folder name for feature-level UI components.

Avoid the `-page` suffix in route component names.

## 8. Review Angular conventions

The project should use:

- standalone components
- signals where relevant
- Angular control flow syntax
- `ChangeDetectionStrategy.OnPush` by default
- typed services
- typed route guards
- feature-oriented organization

## 9. Review formatting

Formatting must be handled by Prettier.

No developer-specific formatting rules should be added locally.

Any formatting rule change must be made first in the engineering standards repository.

## 10. Final validation

Before the first commit of the new Angular project, run:

```powershell
npm run check
```

Then commit the initialized project.
