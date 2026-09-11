# Hardening list

Work this desk can do without pretending to own argent-lang. Upstream bugs go to argent-lang. Items marked **upstream** are Sutton’s. Items marked **desk** are ours.

Status words: **open**, **blocked**, **done**. Nothing is done on this freeze except writing the list.

## A. Compiler guarantees that are still missing (upstream)

From `docs/security-invariants/leader-delegate-input-groups.md` after PR #60:

| ID | Item | Why it matters | Status |
| --- | --- | --- | --- |
| U5 | Rule 5 continuation closure in generated `.sil` | Proof that the leader owns `O(c)` | open |
| U6 | Rule 6 zero-continuation first-input in generated `.sil` | Stops a zero-output ordinary entry from looking like a delegate | open |
| U-tag | GitHub release / version tag | `master` is not a pin you can name in a shop | open |
| U-readme | README still says “once Silverscript completes its audit” | Silverscript v1.0.0 already shipped | open |

Do not build leader/delegate or ICC apps against this desk until U5, U6, and U-tag are done.

## B. README hardening gaps (upstream)

| ID | Item | Status |
| --- | --- | --- |
| H1 | Broader launch and bootstrap tooling | open |
| H2 | Package and dependency tooling | open |
| H3 | Stronger diagnostics and typechecking | open |
| H4 | Generated app-specific builder APIs | open |
| H5 | Broader hardening and negative-test coverage | open |

## C. Follow-ups that affect auditors (upstream)

From `docs/followups.md`:

| ID | Item | Why an auditor cares | Status |
| --- | --- | --- | --- |
| F-launch | Launch proofs | A live covenant ID has no standard package proving how it started | open |
| F-decode | `argent-rt` decode helpers using source names | Observers today depend on generated names such as `gen__mux_routes` | open |
| F-empty | Empty authored / physical state lowering | Silverscript rejects empty structs; identity then has to be the redeem script | open |
| F-kcc20 | KCC20 `Minter::init` + `spawns` bootstrap | Example implements mint, not the two-tx launch Silverscript uses | open |
| F-openobs | Open observed groups | Observers must currently name the complete foreign groups | open |
| F-emits | Correlated `emits` alternatives | Independent unions over-permit output pairs | open |

## D. This desk (xAI)

| ID | Item | Status |
| --- | --- | --- |
| D1 | Pin Silverscript v1.0.0, Argent `master`, playground, template | done (11 Sep freeze) |
| D2 | Recheck script `check.ps1` | done |
| D3 | First reading of published invariants | done in AUDIT.md |
| D4 | Stale README sentence recorded | done |
| D5 | Clone argent @ `867b080` and run `./check.sh` | open |
| D6 | Read generated `.sil` for `examples/tickets.ag` | open |
| D7 | Read generated `.sil` for playground `dex_asset` | open |
| D8 | Confirm rules 5 and 6 are absent in generated leader/delegate contracts | open |
| D9 | Negative-test notes: swapped delegate, extra continuation, wrong spawn index | open |
| D10 | Record whether `check_consistency` rejects a bytecode/metadata mismatch we introduce | open |

D5–D10 need a local Argent checkout. They are not in this GitHub folder on purpose. Do not vendor the compiler here.

## E. Application rules this desk already refuses

Copied from the master file. They stay even if Argent tags tomorrow.

- Foreign `readInputState`
- `State[].split()` tuple destructure on Silverscript v1.0.0
- Guessed compute budget
- Argent ICC / leader-delegate in an STP product before U5+U6+U-tag
- Calling this repository a completed audit

## Recheck

```powershell
.\check.ps1
```

If pins drift, update `pins.json` and rewrite the freeze date. Do not leave a stale SHA in the README.
