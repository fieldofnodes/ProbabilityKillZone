using ProbabilityKillZone
using Documenter

DocMeta.setdocmeta!(ProbabilityKillZone, :DocTestSetup, :(using ProbabilityKillZone); recursive=true)

makedocs(;
    modules=[ProbabilityKillZone],
    authors="Jonathan Miller jonathan.miller@fieldofnodes.com",
    sitename="ProbabilityKillZone.jl",
    format=Documenter.HTML(;
        canonical="https://fieldofnodes.github.io/ProbabilityKillZone.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/fieldofnodes/ProbabilityKillZone.jl",
    devbranch="main",
)
