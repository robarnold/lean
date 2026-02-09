import Lake
open Lake DSL

package «lean-playground» where

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.27.0"

lean_lib Playground where
lean_lib MathIsHaunted where

@[default_target]
lean_exe «lean-playground» where
  root := `Main

lean_exe «math-is-haunted» where
  root := `MathIsHaunted
