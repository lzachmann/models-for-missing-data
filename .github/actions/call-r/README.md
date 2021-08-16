# call-r

This action runs R scripts or commands from bash using `Rscript`.

## Inputs

## `rfile`

**Required** R file. Default `"model-api/.empty.R"`.

## Outputs

## `time`

The time upon completion.

## Example usage

```yml
uses: ./.github/actions/call-r
with:
  rfile: model-api/.empty.R
```
