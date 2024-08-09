module ProbabilityKillZone

using SpecialFunctions

export  
    sigma_φ,
    max_kill_angle_0_to_a,
    max_kill_angle_neg_a_to_a,
    get_num_machines,
    evaluate_at_sigma_a,
    evaluate_at_sigma_a_K1,
    get_expected_num_cycles,
    get_num_cycles





    function sigma_φ(φ)
        R = 0.5
        D = (φ/R)^2
        K3 = 11.1111111
        t = (1/K3)
        sqrt(2*D*t)
    end

    function sigma_φ(φ,K3)
        R = 0.5
        D = (φ/R)^2
        t = (1/K3)
        sqrt(2*D*t)
    end

    function max_kill_angle_0_to_a(γ)
        acos((5-γ^2)/4)
    end

    function max_kill_angle_neg_a_to_a(γ)
        2*max_kill_angle_0_to_a(γ)
    end

    function get_num_machines(K1)
        #ceil(Int,K1/log(2))
        K1/log(2)
    end


    function evaluate_at_sigma_a(sigma,a)
        numerator = sqrt(sigma^2) * (sqrt(2/pi) * sigma * (-exp(-a^2/(2*sigma^2)) - exp(-(a-pi)^2/(2*sigma^2)) + exp(-pi^2/(2*sigma^2)) + 1) - a*erf(a/(sqrt(2)*sigma)) + (a-pi)*erf((pi-a)/(sqrt(2)*sigma)) + pi*erf(pi/(sqrt(2)*sigma)))
        denominator = 2 * (pi - a) * sigma
        numerator / denominator
    end

    function evaluate_at_sigma_a_K1(sigma, a, K1)
        M = get_num_machines(K1)
        numerator = sqrt(sigma^2) * (-M * (sqrt(2/pi) * sigma * (exp(-a^2/(2*sigma^2)) - 1) + a * erf(a/(sqrt(2)*sigma))) + (a*M + 2*pi) * erf((a*M + 2*pi)/(sqrt(2)*M*sigma)) + sqrt(2/pi) * M * sigma * (exp(-(a*M + 2*pi)^2/(2*M^2*sigma^2)) - exp(-2*pi^2/(M^2*sigma^2))) - 2*pi * erf(sqrt(2)*pi/(M*sigma)))
        denominator = 2 * pi * sigma
        numerator / denominator
    end

    function get_expected_num_cycles(p,a)
        1/p + 1 - a/(p*π)
    end

    function get_expected_num_cycles(p, a, K1)
        M = get_num_machines(K1)
        1 + 1/p - (2*pi) / (p * (a*M + 2*pi))
    end

    function get_num_cycles(φ,a)
        sigma = sigma_φ(φ)
        p = evaluate_at_sigma_a(sigma,a)
        get_expected_num_cycles(p,a)
    end

    function get_num_cycles(φ,a,K1)
        sigma = sigma_φ(φ)
        p = evaluate_at_sigma_a_K1(sigma, a, K1)
        get_expected_num_cycles(p, a, K1)
    end

    function get_num_cycles(φ,a,K1,K3)
        sigma = sigma_φ(φ,K3)
        p = evaluate_at_sigma_a_K1(sigma, a, K1)
        get_expected_num_cycles(p, a, K1)
    end


end
