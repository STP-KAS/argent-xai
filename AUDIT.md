# First pass (xAI)

**Not a signed audit. Not argent-lang.** Reading of published documents at the 11 Sep 2026 freeze. Recheck SHAs in `pins.json` before quoting.

Authority used: Argent README, `docs/security-invariants/`, leader/delegate guide, follow-ups, PR #60, Silverscript v1.0.0 release notes. This desk did not recompile Argent, did not run `./check.sh --full`, and did not submit a playground transaction to any Kaspa network.

---

## 1. Status sentence is half-stale

Argent README, Project status:

> The project is still under active development and is not yet release-ready.
> Once Silverscript completes its audit and is released, advanced users who can
> review the generated `.sil` contracts will have a viable path to careful early
> production use.

Silverscript **v1.0.0** is that release (9 Sep 2026). The first sentence still holds. The “once Silverscript completes…” sentence does not.

Keep: Argent is not release-ready. Argent needs its own audit and hardening.
Drop: wording that treats Silverscript’s audit as unfinished.

Quoting only the caution, without the working-pieces list, misdescribes the repo. Quoting only the pieces list, without the caution, also misdescribes it.

## 2. Artifact verification is consistency, not provenance

From `docs/security-invariants/README.md`:

- Verification checks schema, Silverscript ABI, template plan, compiled frames, and declared identity against each other.
- It assumes a supported compiler produced the artifact.
- It does not recompile source.
- It does not attest compiler provenance.
- An attacker can replace bytecode and related metadata together.

PR #60 renamed Argent’s check to match Silverscript’s `check_consistency` and kept identity / template-frame checks as extra steps. The name is honest. A passing check is not “this came from Sutton’s compiler.”

Consumers still need a trusted build or a separately trusted identity. This desk treats an unverified `artifact.json` as untrusted input.

## 3. Leader/delegate proofs rest on two missing compiler rules

PR #60 moved the argument into `docs/security-invariants/leader-delegate-input-groups.md` and marked two rules **[NOT IMPLEMENTED]**:

| Rule | Intended generated check | Status |
| --- | --- | --- |
| 5 Continuation closure | `OpCovOutputCount(c) == OpAuthOutputCount(l)` | not implemented |
| 6 Zero-continuation position | `OpCovInputIdx(c, 0) == this.activeInputIndex` | not implemented |

The same document’s Claim 1 (leader owns the continuation group) uses Rule 5. Claim 2 (ordinary entry cannot occupy a delegate position) uses Rule 6 for the zero-continuation case.

So: the security properties are written. The compiler does not yet emit the checks that the proofs need. PR #60 is explicit that this remains an application-level obligation until those rules land.

This desk’s rule: no coordinated leader/delegate, no ICC, until both rules compile into generated `.sil` **and** Argent has a tag **and** the README drops “not release-ready.”

## 4. Single-actor `readInputState` exception

The invariants allow `readInputState` only when the selected app has one actor and that actor consumes its own type. Multi-actor apps must keep the template witness and use `readInputStateWithTemplate`.

This matches this desk’s Silverscript hole: foreign `readInputState` is unsafe. Argent’s exception is narrower, but it is still a compiler special case. Review any generated `.sil` that calls `readInputState` without a template.

## 5. Genesis spawns rely on untrusted witnesses plus consensus preimage

Spawn clauses receive global output indices as untrusted witnesses. The script reconstructs the KIP-20 genesis ID from the authorizing outpoint and the complete ordered output group. Under hash collision resistance, that authenticates the declared group.

Additional undeclared genesis groups are allowed; they receive no authority from the declaring entry. Launch proofs (follow-ups) are not built. An auditor of a live covenant still has to collect launch data by hand.

## 6. Useful today vs still being built

README “useful today” (present, local):

- compile `.ag` to auditable `.sil`
- build tracked example transactions through `argent-runtime`
- closed and open ICC examples
- route-family and actor-enum examples
- virtual-slot expanded state

README “still being built”:

- broader launch and bootstrap tooling
- richer package and dependency tooling
- stronger diagnostics and typechecking
- generated app-specific builder APIs
- broader hardening and negative-test coverage

Playground and template READMEs: local runtime. They do not connect to a Kaspa network, manage a wallet, or submit transactions. “Examples run” means local construction, not chain acceptance.

## 7. What a real audit still has to do

This pass did not:

- rebuild Argent at `867b080` against Silverscript `3ed9733`
- inspect generated `.sil` for tickets, stones, ICC, open ICC, or the playground DEX
- hunt negative cases for rules 1–4
- prove template-frame identity in compiled frames
- review `argent-runtime` witness filling
- run the playground binaries

Those are the next rows in [HARDENING.md](HARDENING.md). Until they exist, do not call this repo an audit of Argent.

---

*Freeze: 11 Sep 2026. Pins in pins.json. Recheck before quoting.*
