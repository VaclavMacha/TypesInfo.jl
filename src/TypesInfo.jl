module TypesInfo

using InteractiveUtils

export type_summary, supertypes_tree, subtypes_tree

type_summary(::T) where T = type_summary(T)

function type_summary(::Type{T}) where {T <: Any}
    str = isabstracttype(T) ? _summary_abstract(T) : _summary_concrete(T)
    print(str)
    return
end

function _summary_abstract(::Type{T}) where {T <: Any}
    str = """
          $(T):
              - supertype: $(supertype(T))
              - subtypes: $(join(subtypes(T), ", "))
          """
    return str
end

function _summary_concrete(::Type{T}) where {T <: Any}
    str = """
          $(T):
              - supertype: $(supertype(T))
              - fields: $(join(fieldnames(T), ", "))
          """
    return str
end

supertypes_tree(::T, k::Int = 0) where T = supertypes_tree(T, k)

function supertypes_tree(::Type{T}, k::Int = 0) where {T <: Any}
    T === Any && return
    col = isabstracttype(T) ? :blue : :green
    printstyled(repeat("   ", k)..., T, "\n"; bold = true, color = col)
    supertypes_tree(supertype(T), k + 1)
    return
end

function subtypes_tree(::Type{T}, k::Int = 0) where {T <: Any}
    col = isabstracttype(T) ? :blue : :green
    printstyled(repeat("   ", k)..., T; bold = true, color = col)
    println()
    subtypes_tree.(subtypes(T), k + 1)
    return
end

end