# Frontend Angular Versions

This document defines the Angular frontend baseline for the Childcare Management ERP project.

## Current baseline

| Tool        | Version                           |
| ----------- | --------------------------------- |
| Angular     | 22.x                              |
| Angular CLI | 22.x                              |
| TypeScript  | Angular 22 compatible             |
| Node.js     | Angular 22 compatible LTS version |
| RxJS        | Angular 22 compatible             |
| ESLint      | Angular 22 compatible             |
| Prettier    | Shared project version            |

## Scope

This baseline applies to all Angular frontend applications:

- ChildcareManagementERP.Staff.Web
- ChildcareManagementERP.FamilyPortal.Web
- future Angular frontend applications

## Rules

All Angular applications must use the same Angular major version.

All Angular applications must use the same Angular CLI major version.

All Angular applications must use the same TypeScript version range.

All Angular applications must use the same linting and formatting configuration.

A frontend application must not upgrade Angular independently from the other frontend applications.

## Upgrade policy

Patch versions can be updated regularly.

Minor and major versions must be upgraded intentionally across all Angular applications.

Before upgrading Angular, the following must be checked:

- official Angular version compatibility
- Node.js compatibility
- TypeScript compatibility
- Angular CLI compatibility
- angular-eslint compatibility
- build compatibility
- lint compatibility
- formatting compatibility

## Validation commands

Each Angular application must pass:

```powershell
npm install
npm run lint
npm run format:check
npm run build
```

## Notes

Angular 22 is selected as the frontend baseline for this project.

The exact dependency versions must be validated from the official Angular compatibility table before applying the template to real projects.
