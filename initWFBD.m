[old_path]=which('rdsamp');if(~isempty(old_path)) rmpath(old_path(1:end-8)); end
wfdb_url='http://physionet.org/physiotools/matlab/wfdb-app-matlab/wfdb-app-toolbox-0-9-10.zip';
[filestr,status] = urlwrite(wfdb_url,'wfdb-app-toolbox-0-9-10.zip');%Octave users may have to download manually
unzip('wfdb-app-toolbox-0-9-10.zip');
cd wfdb-app-toolbox-0-9-10;cd mcode
addpath(pwd);savepath
cd ../..