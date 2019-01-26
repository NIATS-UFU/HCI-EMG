%This function plot the Targets, which one with a different color, just
%taking in account the protocol chosen (targets size varies according to
%the protocol)

function [H] = plotAll(protocol)
    
    switch protocol
        case 1
    %plot([x1 x2 x3 x4], [y1 y2 y3 y4]);
    plot([641/2 725/2 725/2 641/2 641/2], [372 372 330 330 372], 'r', 'LineWidth',2); %Target 1
    plot([959/2 1043/2 1043/2 959/2 959/2], [213 213 171 171 213], 'y','LineWidth',2); %Target 2
    plot([641/2 725/2 725/2 641/2 641/2], [54 54 12 12 54], 'g','LineWidth',2); %Target 3
    plot([323/2 407/2 407/2 323/2 323/2], [213 213 171 171 213], 'b', 'LineWidth',2); %Target 4

    case 2
    plot([662/2 704/2 704/2 662/2 662/2], [723/2 723/2 681/2 681/2 723/2], 'r', 'LineWidth',2); %Target 1
    plot([980/2 1022/2 1022/2 980/2 980/2], [405/2 405/2 363/2 363/2 405/2],'y','LineWidth',2); %Target 2
    plot([662/2 704/2 704/2 662/2 662/2], [87/2 87/2 45/2 45/2 87/2], 'g','LineWidth',2); %Target 3
    plot([344/2 386/2 386/2 344/2 344/2], [405/2 405/2 363/2 363/2 405/2], 'b', 'LineWidth',2); %Target 4

    case 3
    plot([673/2 694/2 694/2 673/2 673/2], [723/2 723/2 702/2 702/2 723/2], 'r', 'LineWidth',3); %Target 1
    plot([991/2 1012/2 1012/2 991/2 991/2], [395/2 395/2 374/2 374/2 395/2], 'y','LineWidth',3); %Target 2
    plot([673/2 694/2 694/2 673/2 673/2], [77/2 77/2 56/2 56/2 76/2], 'g','LineWidth',3); %Target 3
    plot([355/2 376/2 376/2 355/2 355/2], [395/2 395/2 374/2 374/2 395/2], 'b','LineWidth',3); %Target 4
    end
%     plot([40 120 120 40 40], [500 500 420 420 500]); %Target 2
%     plot([1020 1080 1080 1020 1020], [360 360 280 280 360]); %Target 3
%     plot([641 641+84 641+84 641 641], [500 500 420 420 500]); %Target 4
end

