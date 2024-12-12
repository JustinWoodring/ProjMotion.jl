module ProjMotion

using Plots

function launch(v0, θ, Δt)
    vy = sin(θ)*v0
    vx = cos(θ)*v0
    ay = 9.8

    apogee_t = vy/(ay)
    
    total_t = 2*apogee_t

    times = 0:Δt:total_t
    x = vx.*times
    y = 0 .+ vy.*times .- 1/2*ay*times.^2

    plot!(x,y,label="$(round(rad2deg(θ)))°")
    title!("Height vs Distance for Selected Angles of Launch")
    yaxis!("Height (m)")
    xaxis!("Distance (m)")
end

function launch3d(v0, θ, ϕ, Δt)
    vv = sin(θ)*v0
    vh = cos(θ)*v0
    az = 9.8

    apogee_t = vv/(az)
    
    total_t = 2*apogee_t

    times = 0:Δt:total_t
    x = vh.*times.*sin(ϕ)
    y = vh.*times.*cos(ϕ)
    z = 0 .+ vv.*times .- 1/2*az*times.^2

    plot3d!(x,y,z,label="V = $(v0) m/s\nθ = $(round(rad2deg(θ)))°\nnϕ = $(round(rad2deg(ϕ)))°")
    title!("Height vs Distance for Selected Angles of Launch")
    zaxis!("Height (m)")
    yaxis!("Distance Y (m)")
    xaxis!("Distance X (m)")
end

Plots.plotlyjs()

export launch3d, launch

end # module ProjMotion
