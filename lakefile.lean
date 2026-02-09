import Lake
open Lake DSL

package «lean-playground» where

lean_lib Playground where

@[default_target]
lean_exe «lean-playground» where
  root := `Main
