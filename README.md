# toml-benchmarks


[![GitHub CI](https://github.com/kowainik/toml-benchmarks/workflows/CI/badge.svg)](https://github.com/kowainik/toml-benchmarks/actions)
[![MPL-2.0 license](https://img.shields.io/badge/license-MPL--2.0-blue.svg)](LICENSE)

Benchmarks for Haskell TOML decoding and encoding libraries.

Results with GHC-8.8.3:

| Library            | decode :: Text -> Haskell |
|--------------------|-----------------------------|
| `tomland`          | `370.5 μs`                  |
| `htoml`            | `1.150 ms`                  |
| `htoml-megaparsec` | `561.5 μs`                  |
| `toml-parser`      | `194.1 μs`                  |
