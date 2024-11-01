%md# Plate-element cantilever model
%md
close all, clear all
addpath( genpath( getenv('ONSAS_PATH') ) );
%md
%md## Scalars
E = 200e9 ;
nu = 0.0 ;
tz = .05 ;
qz  = 1e3 ; % kN/m^2 
%md

%md## Numerical solution using plate elements
%md
%md### Materials
%md
materials                    = struct() ;
materials(1).modelName  = 'elastic-linear' ;
materials(1).modelParams = [ E nu ] ;
%md
%md### Elements
%md
elements             = struct() ;
elements(1).elemType = 'edge' ;
elements(1).elemCrossSecParams = tz         ;
elements(2).elemType = 'triangle-shell' ;
elements(2).elemCrossSecParams = {'thickness', tz } ;
%md
%md### Boundary conditions
%md
boundaryConds                  = struct() ;
boundaryConds(1).imposDispDofs =  [ 1 2 3 4 5 6 ] ;
boundaryConds(1).imposDispVals =  [ 0 0 0 0 0 0 ] ;
%
boundaryConds(2).loadsCoordSys = 'global' ;
boundaryConds(2).loadsTimeFact = @(t) t  ;
boundaryConds(2).loadsBaseVals = [0 0 0 0 -qz 0 ] ;
%
%md
%md### mesh
%md
mesh = struct() ;
[ mesh.nodesCoords, mesh.conecCell ] = meshFileReader( 'geometry_scordelisLoRoof.msh' ) ;

%md### Initial conditions
initialConds                  = struct() ;
%md
%md#### Analysis settings
analysisSettings               = struct() ;
analysisSettings.methodName    = 'newtonRaphson' ;
analysisSettings.deltaT        =   1   ;
analysisSettings.finalTime     =   1  ;
analysisSettings.stopTolDeltau =   1e-10    ;
analysisSettings.stopTolForces =   1e-10    ;
analysisSettings.stopTolIts    =   10      ;
%md
%md#### OtherParams
%md The nodalDispDamping is added into the model using:
otherParams                  = struct() ;
%md The name of the problem is:
%md
otherParams.problemName  = 'scordelisLoRoof' ;
otherParams.plots_format = 'vtk' ;
%md
%md Execute ONSAS and save the results:
[ modelInitSol, modelProperties, BCsData ] = ONSAS_init( materials, elements, boundaryConds, initialConds, mesh, analysisSettings, otherParams ) ;
%
%mdAfter that the structs are used to perform the numerical time analysis
[matUs, loadFactorsMat, modelSolutions ] = ONSAS_solve( modelInitSol, modelProperties, BCsData ) ;
%md
