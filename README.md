# Childcare Management ERP - Engineering Standards

This repository contains the engineering standards used across the Childcare Management ERP project.

It provides shared templates, version baselines, tooling conventions and project creation checklists.

## Purpose

The goal of this repository is to keep all projects aligned over time.

It is used to standardize:

- Angular frontend applications
- .NET backend and BFF projects
- development tooling
- project creation workflows
- upgrade workflows

## Repository structure

```text
templates/
  angular/
  dotnet/

versions/
  frontend-angular.md
  backend-dotnet.md
  tooling.md

checklists/
  new-angular-project.md
  angular-upgrade.md
  pull-request.md

scripts/
prompts/
```

## Current priority

The first priority is to define the Angular project template.

This template will be used by:

- ChildcareManagementERP.Staff.Web
- ChildcareManagementERP.FamilyPortal.Web
- future Angular applications
