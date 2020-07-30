# TypesInfo

[![Build Status](https://github.com/VaclavMacha/TypesInfo.jl/workflows/CI/badge.svg)](https://github.com/VaclavMacha/TypesInfo.jl/actions)
[![Coverage](https://codecov.io/gh/VaclavMacha/TypesInfo.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/VaclavMacha/TypesInfo.jl)
[![Coverage](https://coveralls.io/repos/github/VaclavMacha/TypesInfo.jl/badge.svg?branch=master)](https://coveralls.io/github/VaclavMacha/TypesInfo.jl?branch=master)


## Type summary

```julia
using TypesInfo
type_summary(Integer)
```

```
Integer:
    - supertype: Real
    - subtypes: Bool, Signed, Unsigned

```

```julia
type_summary(Int64)
```

```
Int64:
    - supertype: Signed
    - fields: 

```

```julia
type_summary(1)
```

```
Int64:
    - supertype: Signed
    - fields: 

```

```julia
type_summary(1//2)
```

```
Rational{Int64}:
    - supertype: Real
    - fields: num, den

```

## Tree of supertypes

```julia
supertypes_tree(Integer)
```

```
Integer
   Real
      Number

```

```julia
supertypes_tree(Int64)
```

```
Int64
   Signed
      Integer
         Real
            Number

```

```julia
supertypes_tree(1)
```

```
Int64
   Signed
      Integer
         Real
            Number

```

## Tree of subtypes

```julia
subtypes_tree(Integer)
```

```
Integer
   Bool
   Signed
      BigInt
      Int128
      Int16
      Int32
      Int64
      Int8
   Unsigned
      UInt128
      UInt16
      UInt32
      UInt64
      UInt8

```

```julia
subtypes_tree(Number)
```

```
Number
   Complex
   Real
      AbstractFloat
         BigFloat
         Float16
         Float32
         Float64
      AbstractIrrational
         Irrational
      Integer
         Bool
         Signed
            BigInt
            Int128
            Int16
            Int32
            Int64
            Int8
         Unsigned
            UInt128
            UInt16
            UInt32
            UInt64
            UInt8
      Rational

```

---

*This page was generated using [Literate.jl](https://github.com/fredrikekre/Literate.jl).*

