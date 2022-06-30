function opx_client(h, type)
%OPX_CLIENT Throws OmniPlex Client-related errors.
%
% Syntax:
%   error.opx_client(h);
%   error.opx_client(h, type);
%
% Inputs:
%   h - Client handle integer
%   type - (Optional) Can be: 'init' | 'timeout' | ...
%
% See also: Contents

if nargin < 2
    type = 'init'; 
end

switch lower(type)
    case 'init'
        ME = MException('OPX:Client:BadInit', 'OPX_InitClient::Failed to start (code: %d)\n', h);
    case 'timeout'
        ME = MException('OPX:Client:Timeout', 'OPX_WaitForOPXDAQReady::Timed out waiting for OmniPlex to start data acquisition!\n');
    otherwise
        error("ERROR:SYNTAX:TYPE", "Unhandled `type`: %s", type);
end
    
throwAsCaller(ME);

end