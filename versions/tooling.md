# Tooling Versions

This document defines the shared development tooling baseline for the Childcare Management ERP project.

## Purpose

The goal is to keep the developer experience consistent across all repositories and applications.

This includes:

- Node.js
- npm
- Angular CLI
- TypeScript
- ESLint
- Prettier
- Visual Studio Code configuration

## Current frontend tooling baseline

| Tool        | Version                      |
| ----------- | ---------------------------- |
| Node.js     | 24.x LTS                     |
| npm         | version bundled with Node 24 |
| Angular CLI | 22.x                         |
| TypeScript  | Angular 22 compatible        |
| ESLint      | Angular 22 compatible        |
| Prettier    | shared project version       |

## Rules

All Angular frontend applications must use the same Node.js major version.

All Angular frontend applications must use the same Angular CLI major version.

All Angular frontend applications must use the same TypeScript version range.

All Angular frontend applications must use the same ESLint and Prettier configuration.

Tooling versions must not be changed directly inside one application without updating this repository first.

## Recommended VS Code extensions

The recommended extensions are defined in:

```text
templates/angular/vscode/extensions.json
```

## Recommended VS Code settings

The recommended workspace settings are defined in:

```text
templates/angular/vscode/settings.json
```

## Validation

Before a project is considered aligned with the engineering standards, it must pass:

```powershell
npm install
npm run lint
npm run format:check
npm run build
```
