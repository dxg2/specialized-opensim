function [norm_fiber_lengths, fiber_vels, crank_angles] = get_muscle_states(Sx,Sy)
    % for the saddle position defined with an Sx and an Sy, fetch the data
    % outputted by Simulated Forward Kinematics Muscle Analysis:
    % require normalized muscle fiber lengths and muscle fiber
    % velocities (these will be normalized afterwards) 
    % to calculate maximum possible active force versus time
    % for the duration of the simulation episode
    
    trial_name = ['Saddle_x_',num2str(Sx),'_y_',num2str(Sy)];
    trial_folder = [pwd,'\Results\', trial_name, '\SFK\'];
    
    prefix = 'sfk_cyclingleg';
    trial = ['_x_',num2str(Sx),'_y_',num2str(Sy),'_'];

    ma_norm_fiber_length = [trial_folder, prefix, trial, ...
        'MuscleAnalysis_NormalizedFiberLength.sto'];
    ma_fiber_velocity = [trial_folder, prefix, trial, ...
        'MuscleAnalysis_FiberVelocity.sto'];
    kinematics_q = [trial_folder, prefix, trial, ...
        'Kinematics_q.sto'];
    
    norm_fiber_lengths = importdata(ma_norm_fiber_length,'\t');
    fiber_vels = importdata(ma_fiber_velocity,'\t'); 
    kinematics = importdata(kinematics_q,'\t');
    crank_angles = -kinematics.data(:,2);
end
