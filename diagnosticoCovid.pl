/*Alunos: Vinicius F. Speck e Eduardo Paterno*/

nome(abel).
nome(bruna).
nome(carlos).
nome(dani).

idade(abel, 55).
idade(bruna, 61).
idade(carlos, 59).
idade(dani, 65).

quantidadeComorbidades(abel, 2).
quantidadeComorbidades(bruna, 1).
quantidadeComorbidades(carlos, 0).
quantidadeComorbidades(dani, 6).

temperatura(abel, 34).
temperatura(bruna, 37).
temperatura(carlos, 36).
temperatura(dani, 41).

freqCardiaca(abel, 90).
freqCardiaca(bruna, 100).
freqCardiaca(carlos, 90).
freqCardiaca(dani, 180).

freqRespiratoria(abel, 17).
freqRespiratoria(bruna, 20).
freqRespiratoria(carlos, 17).
freqRespiratoria(dani, 39).

paSistolica(abel, 90).
paSistolica(bruna, 100).
paSistolica(carlos, 120).
paSistolica(dani, 55).

sao2(abel, 98).
sao2(bruna, 96).
sao2(carlos, 97).
sao2(dani, 78).

dispneia(abel, "Sim").
dispneia(bruna, "Não").
dispneia(carlos, "Não").
dispneia(dani, "Sim").

temperaturaLeveMedio(T):-
T < 35;
(T >= 37,T < 39).

freqRespiratoriaLeveMedio(FR):-
FR >= 19,
FR =< 30.

casoGrave(P):-
(freqRespiratoria(P, FreqResp), FreqResp > 30);
(paSistolica(P, PaSistolica), PaSistolica < 90);
(sao2(P, Sao2), Sao2 < 95);
(dispneia(P, Dispneia), Dispneia = "Sim").

casoMedio(P):-
(temperatura(P, Temp), temperaturaLeveMedio(Temp));
(freqCardiaca(P, FreqCard), FreqCard > 100);
(freqRespiratoria(P, FreqResp), freqRespiratoriaLeveMedio(FreqResp));
(paSistolica(P, PaSistolica), PaSistolica >= 90, PaSistolica =< 100);
(idade(P, Idade), Idade >= 80);
(quantidadeComorbidades(P, QuantidadeComorbidades),QuantidadeComorbidades > 1).

casoLeve(P):-
(temperatura(P, Temp), temperaturaLeveMedio(Temp));
(freqCardiaca(P, FreqCard), FreqCard > 100);
(freqRespiratoria(P, FreqResp), freqRespiratoriaLeveMedio(FreqResp));
(idade(P, Idade), Idade>=60, Idade<80);
(quantidadeComorbidades(P, QuantidadeComorbidades),QuantidadeComorbidades = 1).

diagnosticoGrave(P):-
casoGrave(P),
write("Caso Grave: deve ser encaminhado para o hospital").

diagnosticoMedio(P):-
casoMedio(P),
write("Caso Médio: deve ficar em casa, em observação por 14 dias.").

diagnosticoLeve(P):-
casoLeve(P),
write("Caso Leve: deve ficar em casa, em observação por 14 dias.").

testarPaciente(P) :-
diagnosticoGrave(P);
diagnosticoMedio(P);
diagnosticoLeve(P);
write("Nenhuma alteração clínica, paciente normal.").

