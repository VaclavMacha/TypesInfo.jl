module TypesInfo

using InteractiveUtils

export type_summary, supertypes_tree, subtypes_tree

type_summary(::T) where T = type_summary(T)

function type_summary(::Type{T}) where {T <: Any}
    if isabstracttype(T)
        _summary_abstract(T)
    else
        _summary_concrete(T)
    end
    return
end

function _summary_abstract(::Type{T}) where {T <: Any}
    println(T)
    println("  - supertypes: ", join(supertypes(T), " <: "))
    println("  - subtypes: ", join(subtypes(T), ", "))
    return
end

function _summary_concrete(::Type{T}) where {T <: Any}
    println(T)
    println("  - supertypes: ", join(supertypes(T), " <: "))

    fields = fieldnames(T)
    if !isempty(fields)
        println("  - fields: ", join(fields, ", "))
    end
    return
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
