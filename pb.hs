λ > take 5 (enumFrom [1..])

<interactive>:80:1: error:
    • Non type-variable argument in the constraint: Enum [t]
      (Use FlexibleContexts to permit this)
    • When checking the inferred type
        it :: forall t. (Enum [t], Enum t, Num t) => [[t]]
