include("StaticObjectsCore.jl")
include("indexing.jl")
include("broadcast.jl")
include("operations.jl")

function compute_static_array(n)
	a = SVector{Int,2}(1,2)
	b = SVector{Int,2}(3,4)

	for _ in Base.OneTo(n)
		a = (a + b) + b
	end

	return a[1],a[2]
end

function compute_array(n)
	a = [1,2]
	b = [3,4]

	for _ in Base.OneTo(n)
		a = (a + b) + b
	end

	return a[1],a[2]
end

function Test()
	n = 10 ^ 7
	d = SMatrix{Int,2,3,6}(1,2,3,4,5,6)
	a = SVector{Int,3}(1,2,3)
	b = SVector{Int,3}(1,2,3)

	@time c = a + b
	println(typeof(c))
	println(c)
end

#Test()